class GridData {
  GridData(
    this.height,
    this.tileSize,
  );
  final double height;
  final double tileSize;
}

GridData gridData({
  required double screenWidth,
  required double paddings,
  required double crossSpace,
  required double mainSpace,
  required double maxRows,
  required double maxColumns,
}) {
  final totalCrossSpace = (maxColumns - 1) * crossSpace +
      paddings; // пространство занятое отступами по ширине Grid
  final totalMainSpace = (maxRows - 1) *
      mainSpace; // пространство занятое отступами по высоте Grid
  final tileSize =
      (screenWidth - totalCrossSpace) / 7; // размер каждого тайла в Gird
  final gridHeight = maxRows * tileSize + totalMainSpace; // высота Grid
  return GridData(
    gridHeight,
    tileSize,
  );
}
