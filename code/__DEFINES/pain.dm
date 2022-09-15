/// Sent when a carbon gains pain. (source = mob/living/carbon/human, obj/item/bodypart/affected_bodypart, amount, type)
#define COMSIG_CARBON_PAIN_GAINED "pain_gain"
/// Sent when a carbon loses pain. (source = mob/living/carbon/human, obj/item/bodypart/affected_bodypart, amount, type)
#define COMSIG_CARBON_PAIN_LOST "pain_loss"
/// Sent when a temperature pack runs out of juice. (source = obj/item/temperature_pack)
#define COMSIG_TEMPERATURE_PACK_EXPIRED "temp_pack_expired"

/// Various lists of body zones affected by pain.
#define BODY_ZONES_ALL list( \
	BODY_ZONE_HEAD, \
	BODY_ZONE_CHEST, \
	BODY_ZONE_L_ARM, \
	BODY_ZONE_R_ARM, \
	BODY_ZONE_L_LEG, \
	BODY_ZONE_R_LEG)

#define BODY_ZONES_LIMBS list( \
	BODY_ZONE_L_ARM, \
	BODY_ZONE_R_ARM, \
	BODY_ZONE_L_LEG, \
	BODY_ZONE_R_LEG)

#define BODY_ZONES_MINUS_CHEST BODY_ZONES_ALL - BODY_ZONE_CHEST
#define BODY_ZONES_MINUS_HEAD BODY_ZONES_ALL - BODY_ZONE_HEAD

/// List of some emotes that convey pain.
#define PAIN_EMOTES list( \
	"wince", \
	"gasp", \
	"grimace", \
	"shiver", \
	"sway", \
	"twitch_s", \
	"whimper", \
	"inhale_s", \
	"exhale_s")

/// Amount of pain gained (to chest) from dismembered limb
#define PAIN_LIMB_DISMEMBERED 90
/// Amount of pain gained (to chest) from surgically removed limb
#define PAIN_LIMB_REMOVED 30

/// Max pains for bodyparts
#define PAIN_LIMB_MAX 70
#define PAIN_CHEST_MAX 120
#define PAIN_HEAD_MAX 100

/// Keys for pain modifiers
#define PAIN_MOD_CHEMS "chems"
#define PAIN_MOD_DRUNK "drunk"
#define PAIN_MOD_SLEEP "asleep"
#define PAIN_MOD_LYING "lying"
#define PAIN_MOD_STASIS "stasis"
#define PAIN_MOD_DROWSY "drowsy"
#define PAIN_MOD_NEAR_DEATH "near-death"
#define PAIN_MOD_RECENT_SHOCK "recently-shocked"
#define PAIN_MOD_QUIRK "quirk"
#define PAIN_MOD_OFF_STATION "off-station-pain-resistance"

/// ID for traits and modifiers gained by pain
#define PAIN_LIMB_PARALYSIS "pain_paralysis"
#define MOVESPEED_ID_PAIN "pain_movespeed"
#define ACTIONSPEED_ID_PAIN "pain_actionspeed"

//Originally in pain_helpers.dm, moved here for superseding issues
/// Cause [amount] pain of default (BRUTE) damage type to [target_zone]
#define cause_pain(target_zone, amount) pain_controller?.adjust_bodypart_pain(target_zone, amount)
/// Cause [amount] pain of [type] damage type to [target_zone]
#define cause_typed_pain(target_zone, amount, dam_type) pain_controller?.adjust_bodypart_pain(target_zone, amount, dam_type)
/// Do pain related [emote] from a mob, and start a [cooldown] long cooldown before a pain emote can be done again.
#define pain_emote(emote, cooldown) pain_controller?.do_pain_emote(emote, cooldown)
/// Increase the minimum amount of pain [zone] can have for [time]
#define apply_min_pain(target_zone, amount, time) apply_status_effect(/datum/status_effect/minimum_bodypart_pain, target_zone, amount, time)
/// Set [id] pain mod to [amount]
#define set_pain_mod(id, amount) pain_controller?.set_pain_modifier(id, amount)
/// Unset [id] pain mod
#define unset_pain_mod(id) pain_controller?.unset_pain_modifier(id)

// Temperature pack stuff - things you can press to people to help reduce pain.
// Heal rate and modifier for generic items that are frozen.
#define FROZEN_ITEM_PAIN_RATE 1
#define FROZEN_ITEM_PAIN_MODIFIER 0.5
#define FROZEN_ITEM_TEMPERATURE_CHANGE -5
