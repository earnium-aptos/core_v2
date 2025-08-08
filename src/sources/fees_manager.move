module earnium_addr::fees_manager {
    use aptos_framework::fungible_asset::{ Metadata, };
    use aptos_framework::object::Object;

    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    struct FeesRewardedPool  has key, store {}

    // **************************** EVENTS ****************************
    #[event]
    struct StakeEvent has drop, store {
        user_address: address,
        reward_pool: Object<FeesRewardedPool>,
        lp: Object<Metadata>,
        amount: u128,
        unlock_time: u64,
        permanently_locked: bool,
        timestamp: u64,
    }

    #[event]
    struct UnstakeEvent has drop, store {
        user_address: address,
        reward_pool: Object<FeesRewardedPool>,
        lp: Object<Metadata>,
        amount: u128,
        timestamp: u64
    }

    #[event]
    struct RewardPaidEvent has drop, store {
        user_address: address,
        reward_pool: Object<FeesRewardedPool>,
        lp: Object<Metadata>,
        amount: u128,
        timestamp: u64
    }

    #[event]
    struct SwapFeePaidEvent has drop, store {
        reward_pool: Object<FeesRewardedPool>,
        lp: Object<Metadata>,
        token: Object<Metadata>,
        swap_fee_amount: u64,
        referrer_address: address,
        referrer_fee_amount: u64,
        protocol_fee_amount: u64,
        timestamp: u64
    }

    #[event]
    struct DefaultFeesConfigEvent has drop, store {
        protocol_fee_bps: u64,
        liquidity_provider_fee_bps: u64,
        referral_fee_bps: u64,
    }

    #[event]
    struct SetFeesConfigEvent has drop, store {
        protocol_fee_bps: u64,
        liquidity_provider_fee_bps: u64,
        referral_fee_bps: u64,
    }

    #[event]
    struct SetStableFeeEvent has drop, store {
        stable_fee_bps: u64,
    }

    #[event]
    struct SetVolatileFeeEvent has drop, store {
        volatile_fee_bps: u64,
    }

    // **************************** Functions ****************************
    #[view]
    public fun accum_reward_scale(): u128 {
        abort 0
    }

    #[view]
    public fun max_swap_fee_bps(): u64 {
        abort 0
    }

    #[view]
    public fun max_swap_fee_schedule_bps(): u64 {
        abort 0
    }

    #[view]
    public fun volatile_fee_bps(): u64 {
        abort 0
    }

    #[view]
    public fun stable_fee_bps(): u64 {
        abort 0
    }
}
