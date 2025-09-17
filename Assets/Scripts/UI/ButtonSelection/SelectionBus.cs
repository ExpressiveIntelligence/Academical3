using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public static class SelectionBus
{
    private class Group
    {
        public readonly HashSet<StickyGroupMember> Members = new HashSet<StickyGroupMember>();
        public StickyGroupMember Current;  // currently selected in this group
        public StickyGroupMember Default;  // first member that registered as default
    }

    private static readonly Dictionary<string, Group> _groups = new Dictionary<string, Group>();

    public static void Register(string groupId, StickyGroupMember member, bool isDefault)
    {
        if (string.IsNullOrEmpty(groupId) || member == null) return;

        Group g;
        if (!_groups.TryGetValue(groupId, out g))
        {
            g = new Group();
            _groups[groupId] = g;
        }

        g.Members.Add(member);

        // First default wins and becomes current immediately (even if others registered earlier).
        if (isDefault)
        {
            if (g.Default == null)
            {
                g.Default = member;
                g.Current = member;
            }
            else if (g.Default != member)
            {
                Debug.LogWarning("SelectionBus: Multiple defaults in group '" + groupId + "'. Using first: " + SafeName(g.Default));
            }
        }

        // If no current yet (no default encountered), fall back to first registrant.
        if (g.Current == null)
        {
            g.Current = member;
        }

        EnsureCurrentIsValid(g);
        ApplyGroupVisuals(g);
    }

    public static void Unregister(string groupId, StickyGroupMember member)
    {
        if (string.IsNullOrEmpty(groupId) || member == null) return;

        Group g;
        if (!_groups.TryGetValue(groupId, out g)) return;

        g.Members.Remove(member);
        if (g.Default == member) g.Default = null;
        if (g.Current == member) g.Current = null;

        // Choose a new current if needed.
        if (g.Current == null)
        {
            if (g.Default != null && g.Members.Contains(g.Default) && IsSelectableActive(g.Default.Button))
            {
                g.Current = g.Default;
            }
            else
            {
                foreach (var m in g.Members)
                {
                    if (IsSelectableActive(m.Button))
                    {
                        g.Current = m;
                        break;
                    }
                }
            }
        }

        if (g.Members.Count == 0)
        {
            _groups.Remove(groupId);
            return;
        }

        EnsureCurrentIsValid(g);
        ApplyGroupVisuals(g);
    }

    public static void RequestSelect(string groupId, StickyGroupMember member)
    {
        if (string.IsNullOrEmpty(groupId) || member == null) return;

        Group g;
        if (!_groups.TryGetValue(groupId, out g)) return;
        if (!g.Members.Contains(member)) return;
        if (!IsSelectableActive(member.Button)) return;

        if (g.Current != member)
        {
            g.Current = member;
            ApplyGroupVisuals(g);
        }
    }

    // Query for the component to know if it should self-enforce.
    public static bool IsCurrent(string groupId, StickyGroupMember member)
    {
        Group g;
        if (!_groups.TryGetValue(groupId, out g)) return false;
        return g.Current == member;
    }

    // ---- Internals ----

    private static void ApplyGroupVisuals(Group g)
    {
        // Let Unity drive visuals; we just point the EventSystem at the group's Current.
        var es = EventSystem.current;
        if (es != null && IsValidMember(g.Current))
        {
            es.SetSelectedGameObject(g.Current.gameObject);
        }
    }

    private static void EnsureCurrentIsValid(Group g)
    {
        if (IsValidMember(g.Current)) return;

        if (IsValidMember(g.Default))
        {
            g.Current = g.Default;
            return;
        }

        foreach (var m in g.Members)
        {
            if (IsValidMember(m))
            {
                g.Current = m;
                return;
            }
        }

        g.Current = null;
    }

    private static bool IsValidMember(StickyGroupMember m)
    {
        return m != null && IsSelectableActive(m.Button) && m.gameObject.activeInHierarchy;
    }

    private static bool IsSelectableActive(Selectable s)
    {
        if (s == null) return false;
        if (!s.gameObject.activeInHierarchy) return false;
        return s.IsInteractable();
    }

    private static string SafeName(StickyGroupMember m)
    {
        return m != null && m.gameObject != null ? m.gameObject.name : "<null>";
    }
}
