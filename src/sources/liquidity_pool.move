/// This module provides a common type of liquidity pool that supports both volatile and stable token pairs. It uses
/// fungible assets underneath and needs a separate router + coin_wrapper to support coins (different standard from
/// fungible assets). Swap fees are kept separately from the pool's reserves and thus don't compound.
///
/// For volatile pairs, the price and reserves can be computed using the constant product formula k = x * y.
/// For stable pairs, the price is computed using k = x^3 * y + x * y^3.
///
/// Note that all functions that return fungible assets such as swap, burn, claim_fees are friend-only since they might
/// return an internal wrapper fungible assets. The router or other modules should provide interface to call these based
/// on the underlying tokens of the pool - whether they're coins or fungible assets. See router.move for an example.
///
/// Another important thing to note is that all transfers of the LP tokens have to call via this module. This is
/// required so that fees are correctly updated for LPs. fungible_asset::transfer and primary_fungible_store::transfer
/// are not supported
module earnium_addr::liquidity_pool {

    use std::string::String;
    use aptos_framework::fungible_asset::{Metadata};
    use aptos_framework::object::Object;
    use earnium_addr::fees_manager::FeesRewardedPool;

    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    struct LiquidityPool has key {}

    struct PoolSnapshot has drop {}

    #[event]
    /// Event emitted when a pool is created.
    struct CreatePoolEvent has drop, store {
        pool: Object<LiquidityPool>,
        token_1: Object<Metadata>,
        token_1_original: String,
        token_2: Object<Metadata>,
        token_2_original: String,
        is_stable: bool,
        fee_schedule_duration: u64,
        timestamp: u64,
    }

    #[event]
    /// Event emitted when a swap happens.
    struct SwapEvent has drop, store {
        pool: address,
        from_token: Object<Metadata>,
        to_token: Object<Metadata>,
        amount_in: u64,
        amount_out: u64,
        fees_amount: u64,
        timestamp: u64
    }

    #[event]
    /// Event emitted when reserves of a liquidity pool are updated.
    struct SyncEvent has drop, store {
        pool: address,
        reserves_1: u128,
        reserves_2: u128,
        timestamp: u64
    }

    #[event]
    /// Event emitted when liquidity is added to a pool.
    struct AddLiquidityEvent has drop, store {
        lp: address,
        pool: address,
        amount_1: u64,
        amount_2: u64,
        timestamp: u64,
        amount_lp: u64
    }

    #[event]
    /// Event emitted when liquidity is removed from a pool.
    struct RemoveLiquidityEvent has drop, store {
        lp: address,
        pool: address,
        amount_lp: u64,
        amount_1: u64,
        amount_2: u64,
        timestamp: u64
    }

    #[event]
    /// Event emitted when LP tokens are transferred.
    struct TransferEvent has drop, store {
        pool: address,
        amount: u64,
        from: address,
        to: address,
        timestamp: u64,
    }

    #[event]
    struct RequestChangePauserEvent has drop, store {
        pauser: address
    }

    #[event]
    struct AcceptPauserEvent has drop, store {
        old_pauser: address,
        new_pauser: address
    }

    #[event]
    struct PauseEvent has drop, store {
        is_paused: bool,
        time: u64
    }

    #[event]
    struct SetPoolSwapFeeEvent has drop, store {
        new_fee_bps: u64,
        new_duration: u64,
    }

    #[event]
    struct SetMaxFeeScheduleDurationEvent has drop, store {
        max_fee_schedule_duration: u64,
    }

    #[view]
    public fun liquidity_pool(
        token_1: Object<Metadata>,
        token_2: Object<Metadata>,
        is_stable: bool,
    ): Object<LiquidityPool> {
        abort 0
    }

    #[view]
    public fun liquidity_pool_address(
        token_1: Object<Metadata>,
        token_2: Object<Metadata>,
        is_stable: bool,
    ): address {
        abort 0
    }

    #[view]
    public fun lp_token_supply<T: key>(pool: Object<T>): u128 {
        abort 0
    }

    #[view]
    public fun pool_reserves(pool: Object<LiquidityPool>): (u64, u64) {
        abort 0
    }

    #[view]
    public fun supported_inner_assets(pool: Object<LiquidityPool>): vector<Object<Metadata>> {
        abort 0
    }

    #[view]
    public fun is_sorted(token_1: Object<Metadata>, token_2: Object<Metadata>): bool {
        abort 0
    }

    #[view]
    public fun is_stable(pool: Object<LiquidityPool>): bool {
        abort 0
    }

    #[view]
    public fun max_fee_schedule_duration(): u64 {
        abort 0
    }

    #[view]
    public fun cliff_swap_fee_bps(pool: Object<LiquidityPool>): u64 {
        abort 0
    }

    #[view]
    public fun swap_fee_bps(pool: Object<LiquidityPool>): u64 {
        abort 0
    }

    #[view]
    public fun swap_fee_bps_by_period(
        period: u64,
        end_swap_fee_bps: u64,
        duration: u64,
    ): u64 {
        abort 0
    }

    #[view]
    public fun get_fee_amount(
        pool: Object<LiquidityPool>,
        amount_in: u64,
    ): u64 {
        abort 0
    }

    #[view]
    public fun liquidity_out(
        token_1: Object<Metadata>,
        token_2: Object<Metadata>,
        is_stable: bool,
        amount_1: u64,
        amount_2: u64
    ): u64 {
        abort 0
    }

    #[view]
    public fun liquidity_amounts(pool: Object<LiquidityPool>, lp_token_amount: u64): (u64, u64) {
        abort 0
    }

    #[view]
    public fun pools(): vector<Object<LiquidityPool>> {
        abort 0
    }

    #[view]
    public fun fees_pool(pool: Object<LiquidityPool>): Object<FeesRewardedPool> {
        abort 0
    }

    /// Creates a new liquidity pool.
    public fun create(
        token_1: Object<Metadata>,
        token_2: Object<Metadata>,
        is_stable: bool,
        fee_schedule_duration: u64,
    ): Object<LiquidityPool> {
        abort 0
    }

    /////////////////////////////////////////////////// USERS /////////////////////////////////////////////////////////

    #[view]
    /// Return the amount of tokens received for a swap with the given amount in and the liquidity pool.
    public fun get_amount_out(
        pool: Object<LiquidityPool>,
        from: Object<Metadata>,
        amount_in: u64,
    ): (u64, u64) {
        abort 0
    }

    fun get_amount_out_without_fee(
        from: Object<Metadata>,
        amount_in: u64,
        pool_snap_shot: PoolSnapshot
    ): u64 {
        abort 0
    }

    #[view]
    public fun pool_metadata(
        pool: Object<LiquidityPool>
    ): (Object<Metadata>, Object<Metadata>, u64, u64, u8, u8, u64, bool, u64, u64) {
        abort 0
    }

    fun pool_snap_shot(
        pool: Object<LiquidityPool>
    ): PoolSnapshot {
        abort 0
    }

    public fun pool_reserve(pool: &LiquidityPool): (u64, u64, u8, u8) {
        abort 0
    }

    #[view]
    /// Return current price and actual price after a swap with the given amount in and the liquidity pool.
    public fun get_trade_diff(
        pool: Object<LiquidityPool>,
        from: Object<Metadata>,
        amount_in: u64,
    ): (u64, u64) {
        abort 0
    }

    //////////////////////////////////////// Liquidity Providers (LPs) ///////////////////////////////////////////////
    public entry fun transfer(
        from: &signer,
        lp_token: Object<LiquidityPool>,
        to: address,
        amount: u64,
    ) {
        abort 0
    }
}
