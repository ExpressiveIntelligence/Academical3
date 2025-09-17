using System.Collections;
using System.Collections.Generic;
using Ink.Parsed;
using UnityEngine;

namespace Academical
{
    /// <summary>
    /// A constants file that allows you to attach music tracks to different types of lookup (days, locations)
    /// </summary>
    public static class MusicLookup
    {
        public static readonly Dictionary<string, string> MusicLabels = new Dictionary<string, string>
        {
            {"cafe", "Samba Isobel"},
            {"hendricks_office", "Airport Lounge"},
            {"lecture_hall", "Deuces"},
            {"library", "Cool Vibes"},
            {"neds_office", "George Street Shuffle"},
            {"outside", "Fuzzball Parade"},
            {"student_cubes", "Hep Cats"}
        };

        public static string GetMusicLabelForLocationID(string locationID)
        {
            string label = null;
            if ( MusicLabels.ContainsKey( locationID ) )
            {
                label = MusicLabels[locationID];
            }
            
            return label;
        }

    }



}
