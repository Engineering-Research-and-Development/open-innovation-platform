<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false; section>
<!-- template: select-authenticator.ftl -->

    <#if section = "header" || section = "show-username">
        <#if section = "header">
            ${msg("loginChooseAuthenticator")}
        </#if>
    <#elseif section = "form">

    <ul class="flex flex-col gap-4" role="list">
        <#list auth.authenticationSelections as authenticationSelection>
            <li class="w-full">
                <form id="kc-select-credential-form" action="${url.loginAction}" method="post">
                    <input type="hidden" name="authenticationExecution" value="${authenticationSelection.authExecId}">
                </form>
                <button type="button" class="w-full group text-left ring-1 ring-brand-200 hover:ring-transparent p-2 rounded-lg hover:bg-brand-500 hover:text-white hover:shadow-xl hover:shadow-brand-300/50 transition" onclick="document.forms[${authenticationSelection?index}].submit()">
                    <div class="font-medium inline-flex items-center gap-2">
                        <span>
                            <#if authenticationSelection.displayName == "otp-display-name" >
                                <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" class="w-5 h-5" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M12 17v4m-2-1l4-2m-4 0l4 2m-9-3v4m-2-1l4-2m-4 0l4 2m12-3v4m-2-1l4-2m-4 0l4 2M7 14V6a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v8m-6-9h2m-1 12v.01"/></svg>
                            <#elseif authenticationSelection.displayName == "webauthn-passwordless-display-name" >
                                <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" aria-hidden="true" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path d="M2.586 17.414A2 2 0 0 0 2 18.828V21a1 1 0 0 0 1 1h3a1 1 0 0 0 1-1v-1a1 1 0 0 1 1-1h1a1 1 0 0 0 1-1v-1a1 1 0 0 1 1-1h.172a2 2 0 0 0 1.414-.586l.814-.814a6.5 6.5 0 1 0-4-4z"/><circle cx="16.5" cy="7.5" r=".5" fill="currentColor"/></g></svg>
                            <#else>
                                <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" class="w-5 h-5" viewBox="0 0 24 24"><path fill="currentColor" d="M2 19v-2h20v2zm1.15-6.05l-1.3-.75l.85-1.5H1V9.2h1.7l-.85-1.45L3.15 7L4 8.45L4.85 7l1.3.75L5.3 9.2H7v1.5H5.3l.85 1.5l-1.3.75l-.85-1.5zm8 0l-1.3-.75l.85-1.5H9V9.2h1.7l-.85-1.45l1.3-.75l.85 1.45l.85-1.45l1.3.75l-.85 1.45H15v1.5h-1.7l.85 1.5l-1.3.75l-.85-1.5zm8 0l-1.3-.75l.85-1.5H17V9.2h1.7l-.85-1.45l1.3-.75l.85 1.45l.85-1.45l1.3.75l-.85 1.45H23v1.5h-1.7l.85 1.5l-1.3.75l-.85-1.5z"/></svg>
                            </#if>
                        </span>

                        <p>${msg('${authenticationSelection.displayName}')}</p>
                    </div>
                    <div class="text-sm text-gray-500 group-hover:text-gray-100">
                        ${msg('${authenticationSelection.helpText}')}
                    </div>
                </button>
            </li>
        </#list>
    </ul>

    </#if>
</@layout.registrationLayout>

