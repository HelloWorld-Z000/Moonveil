scriptName MoonveilKeyDetect extends ActiveMagicEffect

spell property SpellReleaseCharge auto
spell property SpellProjectileH Auto
spell property SpellProjectileV Auto
Actor MoonveilActor


event OnEffectStart(actor akTarget, actor akCaster)
    MoonveilActor = akTarget
    RegisterForKey(47)
    RegisterForAnimationEvent(MoonveilActor, "SoundPlay.WPNSwingBladeMedium")
    RegisterForAnimationEvent(MoonveilActor, "2_SoundPlay.WPNSwingBladeMedium")
endevent

event OnEffectFinish(actor akTarget, actor akCaster)
    unRegisterForKey(47)
    unRegisterForAnimationEvent(MoonveilActor, "SoundPlay.WPNSwingBladeMedium")
    unRegisterForAnimationEvent(MoonveilActor, "2_SoundPlay.WPNSwingBladeMedium")
    MoonveilActor = None
endevent

event OnKeyDown(Int keyCode)
    if keyCode == 47
        MoonveilActor.addspell(SpellReleaseCharge)
    endif
EndEvent    
    
Event OnKeyUp(Int keyCode, Float holdTime)
    if keyCode == 47
        MoonveilActor.removespell(SpellReleaseCharge)
    EndIf
EndEvent    

event OnAnimationEvent(ObjectReference akSource, string asEventName)
    If asEventName == "SoundPlay.WPNSwingBladeMedium"
        SpellProjectileV.Cast(MoonveilActor)
        
    elseIf asEventName == "2_SoundPlay.WPNSwingBladeMedium"
        SpellProjectileH.Cast(MoonveilActor)       
    endif   
endevent