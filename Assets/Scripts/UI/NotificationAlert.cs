using System;

namespace Academical
{
	public class NotificationAlert
	{
		public readonly string message;
		public readonly Action onClickCallback;

		public NotificationAlert(string message, Action onClickCallback)
		{
			this.message = message;
			this.onClickCallback = onClickCallback;
		}

		public NotificationAlert(string message)
		{
			this.message = message;
			onClickCallback = null;
		}
	}
}
