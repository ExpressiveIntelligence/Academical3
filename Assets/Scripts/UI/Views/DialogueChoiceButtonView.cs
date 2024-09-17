using System.Collections.Generic;
using UnityEngine.UIElements;

namespace Academical
{
	public class DialogueChoiceButtonView : UIView
	{
		public static VisualTreeAsset k_DialogueChoiceEffectVisualTree;

		private Label m_ChoiceText;
		private VisualElement m_effectViewsContainer;
		private List<DialogueChoiceButtonEffectView> m_EffectViews;
		private int m_ChoiceIndex;

		public DialogueChoiceButtonView(VisualElement topElement, int choiceIndex)
			: base( topElement )
		{
			m_ChoiceIndex = choiceIndex;
			m_EffectViews = new List<DialogueChoiceButtonEffectView>();
		}

		protected override void RegisterButtonCallbacks()
		{
			(m_TopElement as Button).clicked += OnChoiceClicked;
		}

		protected override void SetVisualElements()
		{
			m_ChoiceText = m_TopElement.Q<Label>( "DialogueChoice__text" );
			m_effectViewsContainer = m_TopElement.Q<VisualElement>( "DialogueChoice__effectContainer" );
		}

		public override void Dispose()
		{
			base.Dispose();
			foreach ( var effectView in m_EffectViews )
			{
				effectView.Dispose();
			}
			m_EffectViews.Clear();
		}

		public void SetChoiceText(string text)
		{
			m_ChoiceText.text = text;
		}

		public void AddChoiceEffect(string effectText)
		{
			var effectView = new DialogueChoiceButtonEffectView(
				k_DialogueChoiceEffectVisualTree.Instantiate()
			);

			effectView.SetText( effectText );

			m_EffectViews.Add( effectView );

			m_effectViewsContainer.Add( effectView.Root );
		}

		private void OnChoiceClicked()
		{
			DialogueEvents.ChoiceSelected?.Invoke( m_ChoiceIndex );
		}
	}
}
