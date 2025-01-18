using UnityEngine;

namespace Anansi
{
	public class SpeakerInfo
	{
		public string SpeakerId { get; }
		public string SpeakerName { get; }
		public string[] Tags { get; }
		public Sprite Sprite;

		public SpeakerInfo(string speakerId, string speakerName, string[] tags)
		{
			SpeakerId = speakerId;
			SpeakerName = speakerName;
			Tags = tags;
		}
	}
}
