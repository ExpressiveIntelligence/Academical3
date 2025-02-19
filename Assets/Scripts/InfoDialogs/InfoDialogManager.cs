using System.Collections.Generic;
using UnityEngine;

namespace Academical
{
	public class InfoDialogManager : MonoBehaviour
	{
		[SerializeField]
		private List<InfoDialogDataSO> dialogs;

		private Dictionary<string, InfoDialogData> m_DialogInfoDict;

		public static InfoDialogManager Instance { get; private set; }

		private void Awake()
		{
			if ( Instance != null )
			{
				Destroy( gameObject );
				return;
			}
			else
			{
				Instance = this;
				m_DialogInfoDict = new Dictionary<string, InfoDialogData>();

				foreach ( InfoDialogDataSO entry in dialogs )
				{
					m_DialogInfoDict.Add( entry.id, entry.GetInfoDialogData() );
				}
			}
		}

		/// <summary>
		/// Display the Info
		/// </summary>
		/// <param name="dialogId"></param>
		public static InfoDialogData GetInfo(string dialogId)
		{
			if ( Instance.m_DialogInfoDict.ContainsKey( dialogId ) )
			{
				return Instance.m_DialogInfoDict[dialogId];
			}
			return null;
		}
	}
}
