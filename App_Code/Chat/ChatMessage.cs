using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ChatMessage
/// </summary>
[Serializable]
public class ChatMessage
{
    public ChatMessage()
    {
    }

    public string chatMessageId { get; set; }
    public string conversationId { get; set; }
    public string senderId { get; set; }
    public string senderName { get; set; }
    public string messageText { get; set; }
    public string displayPrefix { get { return string.Format("[{0}] {1}:", timestamp.ToShortTimeString(), senderName); } }
    public DateTime timestamp { get; set; }
}