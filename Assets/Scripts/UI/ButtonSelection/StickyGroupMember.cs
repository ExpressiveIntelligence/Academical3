using System.Collections;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

[RequireComponent(typeof(Button))]
public class StickyGroupMember : UIBehaviour,
    IPointerClickHandler, ISubmitHandler
{
    [Header("Grouping")]
    [SerializeField] private string groupId;
    [SerializeField] private bool isDefaultForGroup;

    private Button _button;
    public Button Button { get { return _button; } }

    protected override void Awake()
    {
        base.Awake();
        _button = GetComponent<Button>();
    }

    protected override void OnEnable()
    {
        base.OnEnable();
        SelectionBus.Register(groupId, this, isDefaultForGroup);
    }

    protected override void OnDisable()
    {
        base.OnDisable();
        SelectionBus.Unregister(groupId, this);
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        if (!IsActiveAndInteractable()) return;
        SelectionBus.RequestSelect(groupId, this);
    }

    public void OnSubmit(BaseEventData eventData)
    {
        if (!IsActiveAndInteractable()) return;
        SelectionBus.RequestSelect(groupId, this);
    }

    // StandaloneInputModule flicker guard: reassert selection with zero fade for this frame.
    void LateUpdate()
    {
        // Only the group's current member enforces selection.
        if (!SelectionBus.IsCurrent(groupId, this)) return;
        if (!IsActiveAndInteractable()) return;

        var es = EventSystem.current;
        if (es == null) return;

        var cur = es.currentSelectedGameObject;

        // If another interactable Selectable is selected, let it win (user clicked another button).
        if (IsInteractableSelectableGO(cur)) return;

        // If selection is null or on a non-interactable/background, reselect ourselves WITHOUT a visual fade.
        ReassertSelectionNoFade(es);
    }

    private void ReassertSelectionNoFade(EventSystem es)
    {
        if (_button == null) return;

        // Only needed for Color Tint; other transitions typically don't flicker here.
        if (_button.transition == Selectable.Transition.ColorTint)
        {
            var cb = _button.colors;
            if (cb.fadeDuration > 0f)
            {
                float originalFade = cb.fadeDuration;

                // Temporarily zero fade to avoid a visible flash when selection is restored.
                cb.fadeDuration = 0f;
                _button.colors = cb;

                if (!es.alreadySelecting)
                    es.SetSelectedGameObject(gameObject);

                // Restore fade at end of frame (after UI has updated).
                StartCoroutine(RestoreFadeDurationEndOfFrame(originalFade));
                return;
            }
        }

        // Non-ColorTint or already zero fade: just reselect.
        if (!es.alreadySelecting)
            es.SetSelectedGameObject(gameObject);
    }

    private IEnumerator RestoreFadeDurationEndOfFrame(float originalFade)
    {
        // Wait until the very end so the zero-fade selection applies without any transition.
        yield return new WaitForEndOfFrame();

        if (_button != null)
        {
            var cb = _button.colors;
            cb.fadeDuration = originalFade;
            _button.colors = cb;
        }
    }

    private static bool IsInteractableSelectableGO(GameObject go)
    {
        if (go == null) return false;
        var sel = go.GetComponent<Selectable>();
        return sel != null && sel.IsInteractable();
    }

    private bool IsActiveAndInteractable()
    {
        return isActiveAndEnabled && _button != null && _button.IsInteractable();
    }

#if UNITY_EDITOR
    protected override void OnValidate()
    {
        base.OnValidate();
        if (string.IsNullOrEmpty(groupId))
        {
            Debug.LogWarning(name + ": StickyGroupMember has empty groupId.");
        }
        if (_button == null) _button = GetComponent<Button>();
    }
#endif
}
