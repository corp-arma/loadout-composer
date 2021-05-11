#define pixelScale  0.25
#define GRID_W (pixelW * pixelGridNoUIScale * pixelScale)
#define GRID_H (pixelH * pixelGridNoUIScale * pixelScale)
#define WIDTH_TOTAL (safezoneW - 2 * (93 * GRID_W))
#define WIDTH_GAP (WIDTH_TOTAL / 100)
#define WIDTH_SINGLE ((WIDTH_TOTAL - 6 * WIDTH_GAP) / 5)

#define PANEL_W (120 * GRID_W)
#define PANEL_H (safezoneH - (45 * GRID_H))
#define LINE_H (5 * GRID_H)
#define CONTAINER_PANEL_H ((14 * LINE_H) + (3 * GRID_H))

#define GRID_COLUMNS 3
#define GRID_ROWS 20
// #define GRID_W (0.35 * safeZoneW)
// #define GRID_H (0.6 * safeZoneH)
#define GRID_X ((safeZoneW - GRID_W) / 2 + safeZoneX)
#define GRID_Y ((safeZoneH - GRID_H) / 2 + safeZoneY)
#define GRID_PADD (GRID_W / 100)
#define GRID_CELL_W ((GRID_W - ((GRID_COLUMNS + 1) * GRID_PADD)) / GRID_COLUMNS)
#define GRID_CELL_H ((GRID_H - ((GRID_ROWS + 1) * GRID_PADD)) / GRID_ROWS)
#define GRID_NCELL_W(N) (N * GRID_CELL_W + (N - 1) * GRID_PADD)
#define GRID_NCELL_H(N) (N * GRID_CELL_H + (N - 1) * GRID_PADD)
#define GRID_CELL_X(COL) (GRID_X + (GRID_PADD + COL * (GRID_CELL_W + GRID_PADD)))
#define GRID_CELL_Y(ROW) (GRID_Y + (GRID_PADD + ROW * (GRID_CELL_H + GRID_PADD)))
#define GRID_ICELL_Y(ROW) (ROW * (GRID_CELL_H + GRID_PADD))
