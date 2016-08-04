<div id="recipes">
    <g:if test="${recipes}">
       <br/>
       <h3>Recipes</h3>
        <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="title" title="${message(code: 'book.title.label', default: 'Feat')}" />
                            <g:sortableColumn property="pages" title="${message(code: 'book.pages.label', default: 'Pages')}" />
                            <th><g:message code="book.author.label" default="Author" /></th>
                            <th><g:message code="book.publisher.label" default="Publisher" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${recipes}" status="i" var="recipeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${fieldValue(bean: recipeInstance, field: "requiredSkillToCraft")}</td>
                            <td>${fieldValue(bean: recipeInstance, field: "power1")}</td>
                            <td>${fieldValue(bean: recipeInstance, field: "power2")}</td>
                            <td>${fieldValue(bean: recipeInstance, field: "attunementTime")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
    </g:if>
</div>