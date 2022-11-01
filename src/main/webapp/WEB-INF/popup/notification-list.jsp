<%-- 
    Document   : notifcation-list
    Created on : 17 Oct 2022, 10:13:33
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="notification-list" class="dropdown-list dropdown-list_notif">
    <h1>Notifications List</h1>
    <style>
        #notif_list {
            overflow-y: scroll;
            -ms-overflow-style: none;  /* IE and Edge */
            scrollbar-width: none;  /* Firefox */
        }
        #notif_list::-webkit-scrollbar {
            display: none;  /* Chrome */
        }
    </style>
    <div style="overflow: hidden; ">
        <div id="notif_list">
            <h5>Notifications</h5>
        </div>
    </div>
</div>