module earnium_addr::liquidity_stake_pool {
    use std::string::String;
    use aptos_std::simple_map::SimpleMap;
    use aptos_framework::fungible_asset::{Metadata, FungibleAsset};
    use aptos_framework::object::Object;
    use earnium_addr::liquidity_pool::LiquidityPool;

    struct UserInfoResult has drop {}

    struct PoolInfoResult has drop {}

    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    struct RewardsPoolInfo  has key, store {}

    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    struct LiquidityPosition has key {}

    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    struct LiquidityPositionConfig has key {}

    #[event]
    struct RewardsAddedEvent has drop, store {
        pool: Object<RewardsPoolInfo>,
        rewards: String,
        amount: u128,
        new_finish_time: u64,
        timestamp: u64
    }

    #[event]
    struct LiquidityPositionBurned has drop, store {
        position: Object<LiquidityPosition>,
        user: address,
        liquidity_pool: Object<LiquidityPool>,
        amount: u64,
    }

    #[view]
    public fun reward_pool(
        pool: Object<LiquidityPool>
    ): Object<RewardsPoolInfo> {
        abort 0
    }

    #[view]
    public fun incentive_tokens(
        pool: Object<LiquidityPool>
    ): vector<Object<Metadata>> {
        abort 0
    }

    #[view]
    public fun liquidity_collection(): address {
        abort 0
    }

    #[view]
    public fun reward_period_finish(
        pool: Object<LiquidityPool>,
        token: Object<Metadata>
    ): u64 {
        abort 0
    }

    #[view]
    public fun pool_info(
        pool: Object<LiquidityPool>
    ): PoolInfoResult {
        abort 0
    }

    #[view]
    public fun reward_per_sec(
        pool: Object<LiquidityPool>,
        token: Object<Metadata>
    ): u128 {
        abort 0
    }

    #[view]
    public fun stake_token(pool: Object<LiquidityPool>): Object<Metadata> {
        abort 0
    }

    #[view]
    public fun reward_info(
        pool: Object<LiquidityPool>,
        token: Object<Metadata>
    ): (u128, u64, u64, u64) {
        abort 0
    }

    #[view]
    public fun total_stake(pool: Object<LiquidityPool>): u64 {
        abort 0
    }

    #[view]
    public fun claimable_rewards(
        user: address,
        pool: Object<LiquidityPool>
    ): SimpleMap<Object<Metadata>, u128> {
        abort 0
    }

    #[view]
    public fun unlock_time(user: address, pool: Object<LiquidityPool>): u64 {
        abort 0
    }

    #[view]
    public fun staked_balance(user: address, pool: Object<LiquidityPool>): u64 {
        abort 0
    }

    #[view]
    public fun nft_info(
        nft: Object<LiquidityPosition>
    ): (Object<LiquidityPool>, u128, SimpleMap<Object<Metadata>, u128>, u64) {
        abort 0
    }

    #[view]
    public fun user_info(
        user: address,
        pools_addr: vector<address>
    ): vector<UserInfoResult> {
        abort 0
    }

    /// ** Entry Point **
    public entry fun stake(
        user: &signer,
        pool: Object<LiquidityPool>,
        amount: u64
    ) {
        abort 0
    }

    public entry fun stake_and_lock(
        user: &signer,
        pool: Object<LiquidityPool>,
        amount: u64,
        lock_time: u64
    ) {
        abort 0
    }

    public fun create_lock(
        user: &signer,
        asset: FungibleAsset
    ): Object<LiquidityPosition> {
        abort 0
    }

    public entry fun unstake(
        user: &signer,
        pool: Object<LiquidityPool>,
        amount: u64
    ) {
        abort 0
    }

    fun create_position_nft_internal(
        receiver: address,
        liquidity_pool: Object<LiquidityPool>,
        amount: u64
    ): Object<LiquidityPosition> {
        abort 0
    }

    public entry fun claim_all_rewards(
        user: &signer,
        pools: vector<address>,
        nfts: vector<address>
    ) {
        abort 0
    }

    public fun claim_rewards(
        user: &signer,
        pool: Object<LiquidityPool>,
    ): vector<FungibleAsset> {
        abort 0
    }

    public fun nft_claim_rewards(
        user: &signer,
        nft: Object<LiquidityPosition>
    ): vector<FungibleAsset> {
        abort 0
    }
}
