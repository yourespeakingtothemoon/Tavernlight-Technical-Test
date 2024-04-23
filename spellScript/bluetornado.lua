local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
--not the same asset as in the sample video, but it's the closest one
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
combat:setArea(createCombatArea(
{ -- 7x7 diamond
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 0, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{1, 0, 1, 2, 1, 0, 1},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 0, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0}
}
))
--create other combat for additional effect
local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
--not the same asset as in the sample video, but it's the closest one
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat2:setArea(createCombatArea(
{ -- 7x7 diamond
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 1, 0, 1, 0, 1, 0},
{0, 0, 0, 2, 0, 0, 0},
{0, 1, 0, 1, 0, 1, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0}
}
))


function onCastSpell(creature, variant)
    --execute the first combat
    combat:execute(creature, variant)
    --execute the second combat
    combat2:execute(creature, variant)
    return true
end