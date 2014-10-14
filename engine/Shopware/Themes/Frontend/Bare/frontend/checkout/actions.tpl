<div class="actions">
    {* Contiune shopping *}
    {if $sBasket.sLastActiveArticle.link}
    	{block name="frontend_checkout_actions_link_last"}
    	 <a href="{$sBasket.sLastActiveArticle.link}" title="{"{s name='CheckoutActionsLinkLast'}{/s}"|escape}" class="button-left large">
    	 	{s name="CheckoutActionsLinkLast"}{/s}
    	 </a>
    	 {/block}
    {/if}	
    
    {if !$sMinimumSurcharge && ($sInquiry || $sDispatchNoOrder)}
    	{block name="frontend_checkout_actions_inquiry"}
		<a href="{$sInquiryLink}" title="{"{s name='CheckoutActionsLinkOffer'}{/s}"|escape}" class="button-middle large">
			{s name="CheckoutActionsLinkOffer"}{/s}
		</a>
		{/block}
	{/if}
	
	{* Checkout *}
	{if !$sMinimumSurcharge && !$sDispatchNoOrder}
		{block name="frontend_checkout_actions_confirm"}
        <a href="{url action=confirm}" title="{"{s name='CheckoutActionsLinkProceed'}{/s}"|escape}" class="button-right large right checkout" >
			{s name="CheckoutActionsLinkProceed"}{/s}
        </a>
        {/block}
    {/if}
		
	<div class="clear">&nbsp;</div>
</div>