{* ##################################################################################### *}
{$my_popover_created=0}

{function name=makeButton row='' style='primary'}
	{$c=''}
	{if $row.state == 'on'}{$c=' btn-success'}{/if}
	{$command='switch'}
	{if $row.type=='group' || $row.type=='scene'}{$command='scene'}{/if}

<div class="btn-group button_dim">
	<a href='#' name='but_{$row.uid}' data-address='{$row.address}' data-type='{$command}' data-state='{$row.state}' data-onclass='btn-success' class='btn btn-{$style} btn-lg jsButSwitch button_big{$c}'><span class='but_img'><img src='{$p.urls.static}/global/img/icon48_type_{$row.img_type}.png' data-on="{$p.urls.static}/global/img/icon48_type_{$row.type}_on.png" data-off="{$p.urls.static}/global/img/icon48_type_{$row.type}_off.png"></span>{$row.name}</a>

{if $row.type=='dimmer'}
	<a href='#' name='but_{$row.uid}' data-address='{$row.address}' data-type='dimmer' data-value='{$row.value}'  title="{$row.name}" class='btn btn-lg btn-default jsButDimmer jsPopover button_dim'>{$row.value}</a>
{/if}

</div>

{if $row.type=='dimmer' && !$my_popover_created}
<div id="dim_popover" class="hidden">
        <span class="legend">0</span><input type="text" class="span2" value="50" id="rangeSlider" data-slider-min="10" data-slider-max="100" data-slider-step="5" data-slider-value="50"><span class="legend">100</span>
</div>
{$my_popover_created=1}
{/if}

{/function}


{* ##################################################################################### *}

{function name=makeSensorHome row=''}
	<span class='sensor'><img src='{$p.urls.static}/global/img/icon48_type_{$row.img_type}.png'> <b>{$row.value|default:$row.state}</b>{$p.units.{$row.type}}</span>
{/function}