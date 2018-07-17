<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
   aria-controls="collapseExample">
    Editor
</a>
     <div class="form-group">
         <form method="post" class="collapse" id="collapseExample">
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
                 <button type="submit" class="btn btn-primary">Save</button>
                 <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                 <input type="hidden" name="id" value="<#if message??>${message.id}</#if>"/>
             </div>
         </form>