<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<div>
</div>
<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
   aria-controls="collapseExample">
    Reserve
</a>
     <div class="form-group">
         <form method="post" div class="collapse" id="collapseExample">
             <label class="col-sm-2 col-form-label"> User Name:</label>
             <div class="col-sm-6">
                 <input type="text" name="placement" placeholder="Ресурс" class="form-control"/>
                 <input type="text" name="date" placeholder="Дата" class="form-control"/>
                 <input type="text" name="start" placeholder="С" class="form-control"/>
                 <input type="text" name="stop" placeholder="До" class="form-control"/>
                 <input type="text" name="num_us" placeholder="Количество человек" class="form-control"/>
                 <input type="text" name="text" placeholder="Краткое описание" class="form-control"/>
             </div>
     </div>
             <div>
                 <button type="submit" class="btn btn-primary">Add</button>
                 <input type="hidden" name="_csrf" value="${_csrf.token}"/>
             </div>
         </form>
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
</@c.page>