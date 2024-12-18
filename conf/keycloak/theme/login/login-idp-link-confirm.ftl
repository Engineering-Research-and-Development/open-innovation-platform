<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("confirmLinkIdpTitle")}
    <#elseif section = "form">
        <form id="kc-register-form" action="${url.loginAction}" method="post">
            <div class="mt-4">
                <button type="submit" class="px-8 py-2.5 transition bg-brand-600 hover:bg-brand-500 text-white w-max float-right rounded-lg" name="submitAction" id="updateProfile" value="updateProfile">${msg("confirmLinkIdpReviewProfile")}</button>
                <button type="submit" class="px-8 py-2.5 transition bg-brand-600 hover:bg-brand-500 text-white w-max float-right rounded-lg" name="submitAction" id="linkAccount" value="linkAccount">${msg("confirmLinkIdpContinue", idpDisplayName)}</button>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
