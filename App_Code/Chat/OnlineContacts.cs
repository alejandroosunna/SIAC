using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de OnlineContacts
/// </summary>
[Serializable]
public class OnlineContacts
{
    public List<MessageRecipient> messageRecipients { get; set; }
    public OnlineContacts()
    {
        messageRecipients = new List<MessageRecipient>();
    }
}