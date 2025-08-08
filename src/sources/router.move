module earnium_addr::router {
    use aptos_framework::coin::{ Coin};
    use aptos_framework::fungible_asset::{FungibleAsset, Metadata};
    use aptos_framework::object::Object;
    use earnium_addr::liquidity_pool::{ LiquidityPool};

    public entry fun create_pool(
        token_1: Object<Metadata>,
        token_2: Object<Metadata>,
        is_stable: bool,
    ) {
        abort 0
    }

    public entry fun create_pool_with_fee_schedule(
        token_1: Object<Metadata>,
        token_2: Object<Metadata>,
        is_stable: bool,
        duration: u64
    ) {
        abort 0
    }

    public entry fun create_pool_coin<CoinType>(
        token_2: Object<Metadata>,
        is_stable: bool
    ) {
        abort 0
    }

    public entry fun create_pool_both_coins<TokenA, TokenB>(
        is_stable: bool,
    ) {
        abort 0
    }

    /////////////////////////////////////////////////// USERS /////////////////////////////////////////////////////////

    #[view]
    public fun get_trade_diff(
        amount_in: u64,
        from_token: Object<Metadata>,
        to_token: Object<Metadata>,
        is_stable: bool
    ): (u64, u64) {
        abort 0
    }

    #[view]
    public fun get_amount_out(
        amount_in: u64,
        from_token: Object<Metadata>,
        to_token: Object<Metadata>,
        is_stable: bool,
    ): (u64, u64) {
        abort 0
    }

    #[view]
    public fun get_amounts_out(
        amount_in: u64,
        from_token: Object<Metadata>,
        to_tokens: vector<address>,
        is_stable: vector<bool>,
    ): u64 {
        abort 0
    }

    public entry fun swap_entry(
        user: &signer,
        amount_in: u64,
        amount_out_min: u64,
        from_token: Object<Metadata>,
        to_token: Object<Metadata>,
        is_stable: bool,
        recipient: address,
        ref_by: address
    ) {
        abort 0
    }

    public entry fun swap_route_entry(
        user: &signer,
        amount_in: u64,
        amount_out_min: u64,
        from_token: Object<Metadata>,
        to_tokens: vector<Object<Metadata>>,
        is_stables: vector<bool>,
        recipient: address,
        ref_by: address
    ) {
        abort 0
    }

    public entry fun swap_route_entry_from_coin<FromCoin>(
        user: &signer,
        amount_in: u64,
        amount_out_min: u64,
        to_tokens: vector<Object<Metadata>>,
        is_stables: vector<bool>,
        recipient: address,
        ref_by: address
    ) {
        abort 0
    }


    public fun swap_router(
        in: FungibleAsset,
        amount_out_min: u64,
        to_tokens: vector<Object<Metadata>>,
        is_stables: vector<bool>,
        ref_by: address
    ): FungibleAsset {
        abort 0
    }

    public fun swap(
        in: FungibleAsset,
        amount_out_min: u64,
        to_token: Object<Metadata>,
        is_stable: bool,
        ref_by: address
    ): FungibleAsset {
        abort 0
    }

    public entry fun swap_coin_for_asset_entry<FromCoin>(
        user: &signer,
        amount_in: u64,
        amount_out_min: u64,
        to_token: Object<Metadata>,
        is_stable: bool,
        recipient: address,
        ref_by: address
    ) {
        abort 0
    }

    public fun swap_coin_for_asset<FromCoin>(
        in: Coin<FromCoin>,
        amount_out_min: u64,
        to_token: Object<Metadata>,
        is_stable: bool,
        ref_by: address
    ): FungibleAsset {
        abort 0
    }

    /////////////////////////////////////////////////// LPs ///////////////////////////////////////////////////////////

    #[view]
    public fun quote_liquidity(
        token_1: Object<Metadata>,
        token_2: Object<Metadata>,
        is_stable: bool,
        amount_1: u64,
    ): u64 {
        abort 0
    }

    #[view]
    public fun liquidity_amount_out(
        token_1: Object<Metadata>,
        token_2: Object<Metadata>,
        is_stable: bool,
        amount_1: u64,
        amount_2: u64
    ): u64 {
        abort 0
    }

    #[view]
    public fun redeemable_liquidity(pool: Object<LiquidityPool>, amount: u64): (u64, u64) {
        abort 0
    }

    public entry fun add_liquidity_entry(
        lp: &signer,
        token_1: Object<Metadata>,
        token_2: Object<Metadata>,
        is_stable: bool,
        amount_1: u64,
        amount_2: u64,
    ) {
        abort 0
    }

    public entry fun add_liquidity_and_stake_entry(
        lp: &signer,
        token_1: Object<Metadata>,
        token_2: Object<Metadata>,
        is_stable: bool,
        amount_1: u64,
        amount_2: u64,
    ) {
        abort 0
    }

    public entry fun add_liquidity_coin_entry<CoinType>(
        lp: &signer,
        token_2: Object<Metadata>,
        is_stable: bool,
        amount_1: u64,
        amount_2: u64,
    ) {
        abort 0
    }

    public entry fun add_liquidity_and_stake_coin_entry<CoinType>(
        lp: &signer,
        token_2: Object<Metadata>,
        is_stable: bool,
        amount_1: u64,
        amount_2: u64,
    ) {
        abort 0
    }

    public entry fun add_liquidity_both_coins_entry<TokenA, TokenB>(
        lp: &signer,
        is_stable: bool,
        amount_1: u64,
        amount_2: u64,
    ) {
        abort 0
    }

    public entry fun add_liquidity_and_stake_both_coins_entry<TokenA, TokenB>(
        lp: &signer,
        is_stable: bool,
        amount_1: u64,
        amount_2: u64,
    ) {
        abort 0
    }

    public entry fun remove_liquidity_entry(
        lp: &signer,
        token_1: Object<Metadata>,
        token_2: Object<Metadata>,
        is_stable: bool,
        liquidity: u64,
        amount_1_min: u64,
        amount_2_min: u64,
        recipient: address,
    ) {
        abort 0
    }

    public entry fun add_incentives(
        lp: &signer,
        pools: vector<address>,
        assets: vector<address>,
        amounts: vector<u64>,
    ) {
        abort 0
    }

    public entry fun only_operator_add_incentives(
        lp: &signer,
        pools: vector<address>,
        assets: vector<address>,
        amounts: vector<u64>,
        new_finish_time: u64,
    ) {
        abort 0
    }

    fun add_incentives_internal(
        lp: &signer,
        pools: vector<address>,
        assets: vector<address>,
        amounts: vector<u64>,
        new_finish_time: u64
    ) {
        abort 0
    }

    #[view]
    public fun get_optimal_amounts(
        token_1: Object<Metadata>,
        token_2: Object<Metadata>,
        is_stable: bool,
        amount_1: u64,
        amount_2: u64
    ): (u64, u64) {
        abort 0
    }

    fun remove_liquidity_internal(
        lp: &signer,
        token_1: Object<Metadata>,
        token_2: Object<Metadata>,
        is_stable: bool,
        liquidity: u64,
        amount_1_min: u64,
        amount_2_min: u64,
    ): (FungibleAsset, FungibleAsset) {
        abort 0
    }
}
