<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "form">
        <form action="${url.loginAction}" method="post">
            <div id="kc-user-organizations">
                <h2>${msg("organization.select")}</h2>
                <ul class="flex items-center gap-2 <#if user.organizations?size gt 3> flex-wrap </#if>">
                    <#list user.organizations as organization>
                        <li>
                            <a id="organization-${organization.alias}" class="<#if user.organizations?size gt 3></#if>"
                               type="button" onclick="document.forms[0]['kc.org'].value = '${organization.alias}'; document.forms[0].submit()">
                                <span>${organization.name!}</span>
                            </a>
                        </li>
                    </#list>
                </ul>
            </div>
            <input type="hidden" name="kc.org"/>
        </form>
    </#if>

</@layout.registrationLayout>
