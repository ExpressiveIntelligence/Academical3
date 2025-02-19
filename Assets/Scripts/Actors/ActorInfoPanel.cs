using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Academical
{
	public class ActorInfoPanel : UIComponent
	{
		[Header( "UI Elements" )]
		[SerializeField]
		private Button m_CloseButton;

		protected override void SubscribeToEvents()
		{
			base.SubscribeToEvents();
			m_CloseButton.onClick.AddListener( Hide );
		}

		protected override void UnsubscribeFromEvents()
		{
			base.UnsubscribeFromEvents();
			m_CloseButton.onClick.RemoveListener( Hide );
		}

		public override void Show()
		{
			base.Show();
		}
	}
}
