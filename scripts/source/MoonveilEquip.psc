scriptName MoonveilEquip extends ObjectReference

spell property MoonveilSpell auto

Event OnEquipped(actor akActor)
    akActor.addSpell(MoonveilSpell, false)
endEvent

Event OnUnEquipped(actor akActor)
    akActor.removeSpell(MoonveilSpell)
endEvent