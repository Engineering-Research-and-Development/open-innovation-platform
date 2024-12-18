<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("pageExpiredTitle")}
    <#elseif section = "form">
        <div class="bg-[url(../img/question.svg)] h-64 w-full bg-cover bg-center"></div>
        <div id="instruction1-restart" class="instruction text-gray-700 flex gap-2 mt-4">
            ${msg("pageExpiredMsg1")} <a id="loginRestartLink" class="text-brand-600 transition font-medium" href="${url.loginRestartFlowUrl}">${msg("doClickHere")}</a>
        </div>
        <div id="instruction1-continue" class="instruction text-gray-700 flex gap-2">
            ${msg("pageExpiredMsg2")} <a id="loginContinueLink" class="text-brand-600 transition font-medium" href="${url.loginAction}">${msg("doClickHere")}</a>        
        </div>
    </#if>
</@layout.registrationLayout>
