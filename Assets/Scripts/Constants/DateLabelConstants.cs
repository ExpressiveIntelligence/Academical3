using System;
using System.Collections.Generic;
using UnityEngine;

namespace Academical
{
    /// <summary>
    /// A constants file that allows you to attach informational labels to specific days.
    /// To attach a label to a date, specify the day number and the string that matches the label.
    /// </summary>
    public static class DateLabelConstants
    {
        public static readonly Dictionary<int, string> DayLabels = new Dictionary<int, string>
        {
            {1, "First Lab Meeting of Term"},
            {2, "IRB Submission Deadline"},
            {3, "Conference Submission Deadline"},
            {4, "Conference Review Period"},
            {5, "The Big Conference"},
            {6, "Final Lab Meeting of Term"}
        };

        public static readonly Dictionary<int, string> DayStartStorylets = new Dictionary<int, string>
        {
            {1, "day1"},
            {2, "day2"},
            {3, "day3"},
            {4, "day4"},
            {5, "day5"},
            {6, "day6"}
        };

        public static string GetLabelForDay(int dateNum)
        {
            string dateLabel = "No Label Found.";
            if ( DayLabels.ContainsKey( dateNum ) )
            {
                dateLabel = DayLabels[dateNum];
            }
            return dateLabel;

        }
        
        public static string GetStoryletForDayStart(int dateNum)
        {
            string storylet = null;
            if ( DayStartStorylets.ContainsKey( dateNum ) )
            {
                storylet = DayStartStorylets[dateNum];
            }
            return storylet;

        }
    }



}