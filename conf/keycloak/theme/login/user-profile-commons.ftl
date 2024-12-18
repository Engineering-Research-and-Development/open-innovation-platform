<#import "field.ftl" as field>
<#macro userProfileFormFields>
	<#assign currentGroup="">
	
	<#list profile.attributes as attribute>
		<#assign group = (attribute.group)!"">

		<#if group != currentGroup>
			<#assign currentGroup=group>

			<#if currentGroup != "">
				<div class="text-gray-800 mt-3" <#list group.html5DataAnnotations as key, value>data-${key}="${value}"</#list> >
					<#assign groupDisplayHeader=group.displayHeader!"">

					<#if groupDisplayHeader != "">
						<#assign groupHeaderText=advancedMsg(groupDisplayHeader)!group>
					<#else>
						<#assign groupHeaderText=group.name!"">
					</#if>

					<div class="font-semibold">
						<label id="header-${attribute.group.name}">${groupHeaderText}</label>
					</div>

					<#assign groupDisplayDescription=group.displayDescription!"">

					<#if groupDisplayDescription != "">
						<#assign groupDescriptionText=advancedMsg(groupDisplayDescription)!"">

						<div class="text-gray-600 text-sm">
							<label id="description-${group.name}">${groupDescriptionText}</label>
						</div>
					</#if>
				</div>
			</#if>
		</#if>

		<#nested "beforeField" attribute>

		<@field.group name=attribute.name label=advancedMsg(attribute.displayName!'') error=kcSanitize(messagesPerField.get('${attribute.name}'))?no_esc required=attribute.required>
			<#assign inputWrapperClass = "">
			<#if attribute.annotations.inputType?? && (attribute.annotations.inputType == "select-radiobuttons" || attribute.annotations.inputType == "multiselect-checkboxes")>
				<#assign inputWrapperClass = "flex item-center gap-2">
			</#if>
			<div>
				<#if attribute.annotations.inputHelperTextBefore??>
					<span class="text-sm text-gray-500" id="form-help-text-before-${attribute.name}" aria-live="polite">${kcSanitize(advancedMsg(attribute.annotations.inputHelperTextBefore))?no_esc}</span>
				</#if>
				<@inputFieldByType attribute=attribute/>
				<#if attribute.annotations.inputHelperTextAfter??>
					<span class="text-sm text-gray-500" id="form-help-text-after-${attribute.name}" aria-live="polite">${kcSanitize(advancedMsg(attribute.annotations.inputHelperTextAfter))?no_esc}</span>
				</#if>
			</div>
		</@field.group>

		<#nested "afterField" attribute>
	</#list>

	<#list profile.html5DataAnnotations?keys as key>
        <script type="module" src="${url.resourcesPath}/js/${key}.js"></script>
    </#list>
</#macro>


<#macro inputFieldByType attribute>
	<#switch attribute.annotations.inputType!''>
		<#case 'textarea'>
			<@textareaTag attribute=attribute/>
			<#break>
		<#case 'select'>
		<#case 'multiselect'>
			<@selectTag attribute=attribute/>
			<#break>
		<#case 'select-radiobuttons'>
		<#case 'multiselect-checkboxes'>
			<@inputTagSelects attribute=attribute/>
			<#break>
		<#default>
			<#if attribute.multivalued && attribute.values?has_content>
				<#list attribute.values as value>
					<@inputTag attribute=attribute value=value!''/>
				</#list>
			<#else>
				<@inputTag attribute=attribute value=attribute.value!''/>
			</#if>
	</#switch>
</#macro>

<#macro inputTag attribute value>
	<span class="text-gray-800">
		<input 
			type="<@inputTagType attribute=attribute/>" 
			id="${attribute.name}" name="${attribute.name}" 
			value="${(value!'')}" 
			class="px-4 py-2.5 bg-white text-gray-800 rounded-lg border border-gray-300 focus:outline-none focus:border-brand-300 focus:border-dashed focus:ring-1 focus:ring-offset-2 focus:ring-brand-500 w-full"
			aria-invalid="<#if messagesPerField.existsError('${attribute.name}')>true</#if>"
			<#if attribute.readOnly>disabled</#if>
			<#if attribute.autocomplete??>autocomplete="${attribute.autocomplete}"</#if>
			<#if attribute.annotations.inputTypePlaceholder??>placeholder="${advancedMsg(attribute.annotations.inputTypePlaceholder)}"</#if>
			<#if attribute.annotations.inputTypePattern??>pattern="${attribute.annotations.inputTypePattern}"</#if>
			<#if attribute.annotations.inputTypeSize??>size="${attribute.annotations.inputTypeSize}"</#if>
			<#if attribute.annotations.inputTypeMaxlength??>maxlength="${attribute.annotations.inputTypeMaxlength}"</#if>
			<#if attribute.annotations.inputTypeMinlength??>minlength="${attribute.annotations.inputTypeMinlength}"</#if>
			<#if attribute.annotations.inputTypeMax??>max="${attribute.annotations.inputTypeMax}"</#if>
			<#if attribute.annotations.inputTypeMin??>min="${attribute.annotations.inputTypeMin}"</#if>
			<#if attribute.annotations.inputTypeStep??>step="${attribute.annotations.inputTypeStep}"</#if>
			<#if attribute.annotations.inputTypeStep??>step="${attribute.annotations.inputTypeStep}"</#if>
			<#list attribute.html5DataAnnotations as key, value>
					data-${key}="${value}"
			</#list>
		/>
	</span>
</#macro>

<#macro inputTagType attribute>
	<#compress>
		<#if attribute.annotations.inputType??>
			<#if attribute.annotations.inputType?starts_with("html5-")>
				${attribute.annotations.inputType[6..]}
			<#else>
				${attribute.annotations.inputType}
			</#if>
		<#else>
		text
		</#if>
	</#compress>
</#macro>

<#macro textareaTag attribute>
	<textarea 
		id="${attribute.name}" 
		name="${attribute.name}" 
		class="px-4 py-2.5 bg-white text-gray-800 rounded-lg border border-gray-300 focus:outline-none focus:border-brand-300 focus:border-dashed focus:ring-1 focus:ring-offset-2 focus:ring-brand-500 w-full"
		aria-invalid="<#if messagesPerField.existsError('${attribute.name}')>true</#if>"
		<#if attribute.readOnly>disabled</#if>
		<#if attribute.annotations.inputTypeCols??>cols="${attribute.annotations.inputTypeCols}"</#if>
		<#if attribute.annotations.inputTypeRows??>rows="${attribute.annotations.inputTypeRows}"</#if>
		<#if attribute.annotations.inputTypeMaxlength??>maxlength="${attribute.annotations.inputTypeMaxlength}"</#if>
	>${(attribute.value!'')}</textarea>
</#macro>

<#macro selectTag attribute>
	<select 
		id="${attribute.name}" 
		name="${attribute.name}"
		class="px-4 py-2.5 bg-white text-gray-800 rounded-lg border border-gray-300 focus:outline-none focus:border-brand-300 focus:border-dashed focus:ring-1 focus:ring-offset-2 focus:ring-brand-500 w-full"
		aria-invalid="<#if messagesPerField.existsError('${attribute.name}')>true</#if>"
		<#if attribute.readOnly>disabled</#if>
		<#if attribute.annotations.inputType=='multiselect'>multiple</#if>
		<#if attribute.annotations.inputTypeSize??>size="${attribute.annotations.inputTypeSize}"</#if>
	>
		<#if attribute.annotations.inputType=='select'>
			<option value=""></option>
		</#if>

		<#if attribute.annotations.inputOptionsFromValidation?? && attribute.validators[attribute.annotations.inputOptionsFromValidation]?? && attribute.validators[attribute.annotations.inputOptionsFromValidation].options??>
			<#assign options=attribute.validators[attribute.annotations.inputOptionsFromValidation].options>
		<#elseif attribute.validators.options?? && attribute.validators.options.options??>
			<#assign options=attribute.validators.options.options>
		<#else>
			<#assign options=[]>
		</#if>

		<#list options as option>
			<option value="${option}" <#if attribute.values?seq_contains(option)>selected</#if>><@selectOptionLabelText attribute=attribute option=option/></option>
		</#list>
	</select>
</#macro>

<#macro inputTagSelects attribute>
	<#if attribute.annotations.inputType=='select-radiobuttons'>
		<#assign inputType='radio'>
		<#assign classDiv="flex items-center" >
		<#assign classInput="text-brand-600 focus:outline-none focus:ring-2 focus:ring-brand-500">
		<#assign classLabel="cursor-pointer">
	<#else>	
		<#assign inputType='checkbox'>
		<#assign classDiv="flex items-center">
		<#assign classInput="rounded mb-1 focus:outline-none outline-none border border-brand-400 text-brand-600 ring-1 ring-brand-300/25 focus:ring-brand-300">
		<#assign classLabel="cursor-pointer">
	</#if>
	
	<#if attribute.annotations.inputOptionsFromValidation?? && attribute.validators[attribute.annotations.inputOptionsFromValidation]?? && attribute.validators[attribute.annotations.inputOptionsFromValidation].options??>
        <#assign options=attribute.validators[attribute.annotations.inputOptionsFromValidation].options>
    <#elseif attribute.validators.options?? && attribute.validators.options.options??>
        <#assign options=attribute.validators.options.options>
    <#else>
        <#assign options=[]>
    </#if>

    <div class="flex items-center gap-3">
		<#list options as option>
			<div class="w-max flex items-center gap-1">
				<input 
						type="${inputType}" 
						id="${attribute.name}-${option}" 
						name="${attribute.name}" 
						value="${option}" 
						class="${classInput}"
					aria-invalid="<#if messagesPerField.existsError('${attribute.name}')>true</#if>"
					<#if attribute.readOnly>disabled</#if>
					<#if attribute.values?seq_contains(option)>checked</#if>
				/>
				<label for="${attribute.name}-${option}" class="${classLabel} <#if attribute.readOnly>text-gray-500</#if>"><@selectOptionLabelText attribute=attribute option=option/></label>
			</div>
		</#list>
	</div>
</#macro>

<#macro selectOptionLabelText attribute option>
	<#compress>
		<#if attribute.annotations.inputOptionLabels??>
			${advancedMsg(attribute.annotations.inputOptionLabels[option]!option)}
		<#else>
			<#if attribute.annotations.inputOptionLabelsI18nPrefix??>
				${msg(attribute.annotations.inputOptionLabelsI18nPrefix + '.' + option)}
			<#else>
				${option}
			</#if>
		</#if>
	</#compress>
</#macro>
