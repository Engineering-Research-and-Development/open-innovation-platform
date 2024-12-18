<#import "template.ftl" as layout>
<#import "buttons.ftl" as buttons>
<#import "alert.ftl" as loginAlert>

<@layout.registrationLayout; section>
<!-- template: delete-account-confirm.ftl -->

    <#if section = "header">
      ${msg("deleteAccountConfirm")}
    <#elseif section = "form">

      <form action="${url.loginAction}" id="kc-deleteaccount-form" method="post">
        <@loginAlert.alert message={"type": "warning", "summary": msg("irreversibleAction")} />

        <p class="font-medium">${msg("deletingImplies")}</p>
        <ul role="list" class="my-4 pl-4">
          <li>&bull; ${msg("loggingOutImmediately")}</li>
          <li class="text-red-600">&bull; ${msg("errasingData")}</li>
        </ul>

        <p class="delete-account-text">${msg("finalDeletionConfirmation")}</p>

        <@buttons.actionGroup>
          <#if triggered_from_aia>
            <@buttons.buttonOutline name="cancel-aia" label="doCancel" class=[]/>
          </#if>
          <@buttons.button label="doConfirmDelete" class=[]/>
        </@buttons.actionGroup>
      </form>
    </#if>

</@layout.registrationLayout>