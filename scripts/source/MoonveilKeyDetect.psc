scriptName MoonveilKeyDetect extends ActiveMagicEffect

spell property SpellRelease auto
spell property SpellReleaseDirection auto
spell property SpellProjectileH Auto
spell property SpellProjectileV Auto
globalvariable property SpellMoonveilToggle auto
Actor MoonveilActor


event OnEffectStart(actor akTarget, actor akCaster)
    MoonveilActor = akTarget
    self.RegisterForControl("Left Attack/Block")   
    self.RegisterForControl("Forward")  
    self.RegisterForControl("Back")  
    self.RegisterForControl("Strafe Left")  
    self.RegisterForControl("Strafe Right")  
    self.RegisterForAnimationEvent(MoonveilActor, "weaponSwing")
endevent

event OnEffectFinish(actor akTarget, actor akCaster)
    self.UnRegisterForControl("Left Attack/Block")   
    self.unRegisterForControl("Forward")  
    self.unRegisterForControl("Back")  
    self.unRegisterForControl("Strafe Left")  
    self.unRegisterForControl("Strafe Right")  
    self.UnRegisterForAnimationEvent(MoonveilActor, "weaponSwing")
    MoonveilActor = None
endevent


event OnControlDown(String Control)

    if Control == "Forward" 
        SpellMoonveilToggle.SetValue(1)
        SpellReleaseDirection.Cast(MoonveilActor)
    elseif Control == "Back"
        SpellMoonveilToggle.SetValue(1)
        SpellReleaseDirection.Cast(MoonveilActor)
    elseif Control == "Strafe Left"
        SpellMoonveilToggle.SetValue(2)
        MoonveilActor.DispelSpell(SpellReleaseDirection)
    elseif Control == "Strafe Right"
        SpellMoonveilToggle.SetValue(2)
        MoonveilActor.DispelSpell(SpellReleaseDirection)
    EndIf
endevent    
    
event OnControlUp(String Control, Float HoldTime)

    if Control == "Left Attack/Block"
        SpellRelease.Cast(MoonveilActor)
    elseif Control == "Forward" 
        MoonveilActor.DispelSpell(SpellReleaseDirection)
    elseif Control == "Back"
        MoonveilActor.DispelSpell(SpellReleaseDirection)
    elseif Control == "Strafe Left"
        MoonveilActor.DispelSpell(SpellReleaseDirection)
    elseif Control == "Strafe Right"
        MoonveilActor.DispelSpell(SpellReleaseDirection)
    EndIf
endevent    

event OnAnimationEvent(ObjectReference akSource, string asEventName)
    If asEventName == "weaponSwing" && SpellMoonveilToggle.value == 1
        SpellProjectileV.Cast(MoonveilActor)
        SpellMoonveilToggle.SetValue(0)
    elseIf asEventName == "weaponSwing" && SpellMoonveilToggle.value == 2
        SpellProjectileH.Cast(MoonveilActor)       
        SpellMoonveilToggle.SetValue(0)
    endif   
endevent