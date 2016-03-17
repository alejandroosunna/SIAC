﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ChatRoom
/// </summary>
[Serializable]
public class ChatRoom
{
    public string chatRoomId { get; set; }
    public string chatRoomInitiatedBy { get; set; }
    public string chatRoomInitiatedTo { get; set; }
    public List<MessageRecipient> messageRecipients { get; set; }

    public ChatRoom()
    {
        chatRoomId = Guid.NewGuid().ToString();
        messageRecipients = new List<MessageRecipient>();
    }
}
