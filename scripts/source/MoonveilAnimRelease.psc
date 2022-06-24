scriptName MoonveilAnimRelease extends ActiveMagicEffect

idle property AnimRelease auto

function OnEffectStart(Actor akTarget, Actor akCaster)

    akCaster.PlayIdle(AnimRelease)
endFunction
