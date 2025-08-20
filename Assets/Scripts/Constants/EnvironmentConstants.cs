using System;
using System.Collections.Generic;
using UnityEngine;

namespace Academical
{
    /// <summary>
    /// A constants file that determines environment runtime behavior.
    /// Used primarily to enable debug modes.
    /// </summary>
    public static class EnvironmentConstants
    {
        /// <summary>
        /// Determines if the game checks for all conversations to be completed before advancing to the next day.
        /// </summary>
        public static bool DayRequirementsEnabled = false;

    }

}