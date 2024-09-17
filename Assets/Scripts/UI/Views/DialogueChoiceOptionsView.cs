using System.Collections.Generic;
using Anansi;
using UnityEngine.UIElements;

namespace Academical
{
	public class DialogueChoiceOptionsView : UIView
	{
		public static VisualTreeAsset k_ChoiceButtonVisualTree;

		private List<DialogueChoiceButtonView> m_Choices;

		public DialogueChoiceOptionsView(VisualElement topElement)
			: base( topElement )
		{
			m_Choices = new List<DialogueChoiceButtonView>();
		}

		public override void Dispose()
		{
			base.Dispose();
			foreach ( var choiceView in m_Choices )
			{
				choiceView.Dispose();
			}
			m_Choices.Clear();
		}

		public void AddChoice(Choice choice)
		{
			var choiceView = new DialogueChoiceButtonView(
				k_ChoiceButtonVisualTree.Instantiate(),
				choice.Index
			);

			m_Choices.Add( choiceView );
			Root.Add( choiceView.Root );
		}
	}
}
