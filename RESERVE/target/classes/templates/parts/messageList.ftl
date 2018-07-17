<div>Список сообщений</div>

<#list messages as message>
       <div>

           <b>${message.id}</b>
           <span>${message.placement}</span>
           <span>${message.date}</span>
           <#assign createdOn='${message.date}'>
           <span>${message.start}</span>
           <span>${message.stop}</span>
           <span>${message.num_us}</span>
           <span>${message.text}</span>
           <span>${message.authorName}</span>
       </div>
<#else>
No message
</#list>