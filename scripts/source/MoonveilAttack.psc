scriptName MoonveilAttack extends ActiveMagicEffect

Actor MoonveilActorAtk


event OnEffectStart(actor akTarget, actor akCaster)
    MoonveilActorAtk = akTarget
    RegisterForKey(256)
    RegisterForKey(257)
endevent

event OnEffectFinish(actor akTarget, actor akCaster)
    unRegisterForKey(256)
    unRegisterForKey(257)
   MoonveilActorAtk = None
endevent


event OnKeyDown(Int keyCode)
    If KeyCode == 256
        debug.SendAnimationEvent(MoonveilActorAtk, "attackPowerStartLeft")
    elseif KeyCode == 257
        debug.SendAnimationEvent(MoonveilActorAtk, "attackPowerStartRight")
    endif
EndEvent    

