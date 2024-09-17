using UnityEngine;
using UnityEngine.UIElements;

namespace Academical
{
	/// <summary>
	/// A view for a single effect entry in a choice buttons list of effects.
	/// </summary>
	public class DialogueChoiceButtonEffectView : UIView
	{
		private VisualElement m_IconContainer;
		private Label m_EffectText;

		public DialogueChoiceButtonEffectView(VisualElement topElement) : base( topElement ) { }

		protected override void SetVisualElements()
		{
			m_IconContainer = m_TopElement.Q<VisualElement>( "ChoiceEffect__Icon" );
			m_EffectText = m_TopElement.Q<Label>( "ChoiceEffect__Text" );
		}

		public void SetIcon(Sprite effectIcon)
		{
			m_IconContainer.style.backgroundImage = new StyleBackground( effectIcon );
		}

		public void SetText(string text)
		{
			m_EffectText.text = text;
		}
	}
}
