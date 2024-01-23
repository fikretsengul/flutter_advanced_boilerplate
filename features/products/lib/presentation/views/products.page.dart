// Copyright 2024 Fikret Şengül. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:deps/design/design.dart';
import 'package:deps/features/features.dart';
import 'package:deps/packages/auto_route.dart';
import 'package:deps/packages/cached_network_image_plus.dart';
import 'package:deps/packages/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/models/product.model.dart';
import '../cubits/product_list.cubit.dart';

@RoutePage()
class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  final productListCubit = $.get<ProductListCubit>();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      forceScroll: true,
      margin: $.paddings.md.horizontal,
      appBar: AppBarSettings(
        title: const Text('Products'),
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Icon(CupertinoIcons.heart),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Icon(CupertinoIcons.cart),
          ),
          PaddingGap.xs(),
        ],
        largeTitle: AppBarLargeTitleSettings(
          largeTitle: $.tr.products.title,
          actions: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 0,
              onPressed: () => $.get<UserCubit>().logout(),
              child: CacheNetworkImagePlus(
                borderRadius: 16,
                imageUrl: $.get<UserCubit>().state.avatar,
                width: 30,
                height: 30,
              ),
            ),
          ],
        ),
        searchBar: AppBarSearchBarSettings(
          enabled: true,
        ),
      ),
      onRefresh: productListCubit.refresh,
      body: BlocProvider(
        create: (_) => productListCubit,
        child: PaginatedList<ProductModel, ProductListCubit>(
          scrollController: scrollController,
          onNextPage: (offset) => productListCubit.getProducts(offset: offset),
          itemBuilder: (_, product, __) {
            return CupertinoCard(
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: CacheNetworkImagePlus(
                      boxFit: BoxFit.cover,
                      imageUrl: product.images.first,
                    ),
                  ),
                  const Expanded(
                    flex: 5,
                    child: SizedBox(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}