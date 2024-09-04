// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 1;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      image: fields[0] as String,
      title: fields[1] as String,
      details: fields[2] as String,
      price: fields[3] as num,
      isInStock: fields[6] as bool,
      category: fields[4] as String,
      productId: fields[9] as String,
      isBestSelling: fields[10] as bool?,
      reviews: (fields[5] as List?)?.cast<ReviewModel>(),
      sizes: (fields[7] as List?)?.cast<dynamic>(),
      colors: (fields[8] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.details)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.reviews)
      ..writeByte(6)
      ..write(obj.isInStock)
      ..writeByte(7)
      ..write(obj.sizes)
      ..writeByte(8)
      ..write(obj.colors)
      ..writeByte(9)
      ..write(obj.productId)
      ..writeByte(10)
      ..write(obj.isBestSelling);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
