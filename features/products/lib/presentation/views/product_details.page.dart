// ignore_for_file: max_lines_for_function, max_lines_for_file
import 'package:deps/design/design.dart';
import 'package:deps/features/features.dart';
import 'package:deps/packages/auto_route.dart';
import 'package:deps/packages/cached_network_image_plus.dart';
import 'package:deps/packages/nested_scroll_view_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/models/product.model.dart';

@RoutePage()
class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({
    required this.product,
    super.key,
  });

  final ProductModel product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late String _selectedImage = widget.product.images.first;

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      margin: $.paddings.md.horizontal,
      appBar: AppBarSettings(
        title: const Text(
          'Product Details',
        ),
        previousPageTitle: $.tr.products.title,
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Icon(CupertinoIcons.add),
          ),
          PaddingGap.xs(),
        ],
        largeTitle: AppBarLargeTitleSettings(
          largeTitle: 'Product Details',
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          const OverlapInjectorPlus(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 8,
                        child: Hero(
                          tag: '${widget.product.id}',
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 100),
                            transitionBuilder: (child, animation) {
                              return FadeTransition(opacity: animation, child: child);
                            },
                            child: CacheNetworkImagePlus(
                              key: ValueKey<String>(_selectedImage),
                              boxFit: BoxFit.cover,
                              borderRadius: 16,
                              width: context.width,
                              imageUrl: _selectedImage,
                            ),
                          ),
                        ),
                      ),
                      PaddingGap.md(),
                      Expanded(
                        flex: 2,
                        child: Wrap(
                          runSpacing: $.paddings.md,
                          children: widget.product.images.map((image) {
                            return CupertinoButton(
                              padding: EdgeInsets.zero,
                              minSize: 0,
                              onPressed: () => setState(() {
                                _selectedImage = image;
                              }),
                              child: CupertinoImage(
                                uri: image,
                                height: (300 - ((widget.product.images.length - 1) * $.paddings.md)) /
                                    (widget.product.images.length),
                                border: Border.fromBorderSide(
                                  BorderSide(
                                    color: _selectedImage == image
                                        ? CupertinoTheme.of(context).primaryColor
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                PaddingGap.md(),
                CupertinoCard(
                  padding: $.paddings.sm.all,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.title,
                        style: context.textTheme.titleLarge,
                      ),
                      PaddingGap.sm(),
                      Text(
                        widget.product.description,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.textTheme.bodyMedium?.color?.withOpacity(0.8),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}