# 虎式 I 型 · 131

浏览器里可直接旋转查看的虎式坦克模型。原生 Three.js，无框架、无 CDN 依赖，整个目录自包含。

## 文件

| 文件 | 说明 |
|---|---|
| `index.html` | 查看器页面（全部逻辑与样式都在里面） |
| `tiger.glb` | 模型 + 1K 烘焙贴图，**1.1 MB** |
| `vendor/` | Three.js r169 及 OrbitControls / GLTFLoader |
| `本地预览.bat` | 双击启动本地服务器并打开浏览器 |

整个目录约 1.9 MB。

## 本地预览

双击 `本地预览.bat`。

> 不能直接双击 `index.html`：浏览器出于安全限制，不允许 `file://` 页面加载 ES 模块和 `.glb`，必须走 http。

## 操作

- 拖动旋转 / 滚轮缩放（手机上单指转、双指缩放）
- 底部「炮塔」滑块：炮塔左右各转 60°
- 「前 3/4 / 正侧面 / 低角度」：切换固定机位
- 打开后自动缓慢环绕，一旦操作即停止

## 发布到 GitHub Pages

1. 在 GitHub 新建仓库（Public），例如 `tiger-i-131`
2. 把本目录**里面的全部内容**上传到仓库根目录（`index.html` 必须在根目录）
3. 仓库 Settings → Pages → Source 选 `Deploy from a branch`，分支 `main`，目录 `/ (root)`，Save
4. 等 1~2 分钟，访问 `https://<用户名>.github.io/tiger-i-131/`

## 关于贴图

模型在 Blender 里用的是程序化节点材质（三维噪声算出来的迷彩），glTF 无法携带，所以出图前已烘焙成：

- `Camo_Base` / `Camo_Rough` —— 车体与炮塔的迷彩、积尘、磨损
- `Gear_Base` / `Gear_Rough` —— 履带、负重轮、炮管、编号等

分辨率 1024×1024，JPEG 压缩，嵌在 GLB 内部。1K 下车体迷彩完全够用，近看编号边缘会略软。

## 层级

```
Tiger_I            (根节点)
├─ WEB_H_Camo      车体 · 迷彩
├─ WEB_H_Other     车体 · 履带/负重轮/灯
└─ Turret_Pivot    ← 炮塔转轴（网页旋转的就是这个节点）
   ├─ WEB_T_Camo   炮塔 · 迷彩
   └─ WEB_T_Other  炮塔 · 炮管/编号/舱盖
```
