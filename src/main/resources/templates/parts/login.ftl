<#macro login path>
<form action="${path}" method="post">
    <div class="form-group">
        <label class="col-sm-2 col-form-label"> User Name :</label>
        <div class="col-sm-6">
            <input type="text" name="username" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 col-form-label"> Password:</label>
        <div class="col-sm-6">
            <input type="text" name="password" class="form-control"/>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 col-form-label"> Email:</label>
        <div class="col-sm-6">
            <input type="email" name="email" class="form-control" placeholder="test@test.com"/>
        </div>
    </div>
    <div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Sign In</button>
    </div>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button class="btn btn-primary" type="submit">Sign Out</button>
</form>
</#macro>