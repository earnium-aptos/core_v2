module earnium_addr::coin_wrapper {
    use std::string::String;
    use aptos_framework::coin::Coin;
    use aptos_framework::fungible_asset::{Metadata, FungibleAsset};
    use aptos_framework::object::Object;

    public fun format_fungible_asset(metadata: Object<Metadata>): String {
        abort 0
    }

    public fun get_coin_type(metadata: Object<Metadata>): String {
        abort 0
    }

    #[view]
    public fun get_original(metadata: Object<Metadata>): String {
        abort 0
    }

    #[view]
    public fun get_wrapper<T0>(): Object<Metadata> {
        abort 0
    }

    public fun is_supported<T0>(): bool {
        abort 0
    }

    public fun is_wrapper(metadata: Object<Metadata>): bool {
        abort 0
    }

    public fun wrap<T0>(asset: Coin<T0>): FungibleAsset {
        abort 0
    }
}

