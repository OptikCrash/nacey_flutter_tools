Buttons
=

Regular buttons
-

### [Material Button types](https://material.io/components/buttons)

#### Outlined
<img src="../../../assets/clips/btn_outlined.png" alt="material outlined button" style="margin-left:6px;" />

```dart
  final NButton button = NButton(child: Text('Button'), onPressed: (){}, useMaterial: true);
```

<img src="../../../assets/clips/btn_w_icon_outlined.png" alt="material outlined button" style="margin-left:6px;" />

```dart
  final NButtonWithIcon button = NButtonWithIcon(icon: Icon(Icons.star), label: 'Button', onPressed: (){}, useMaterial: true);
  final NButtonWithIcon button = NButton.icon(icon: Icon(Icons.star), label: 'Button', onPressed: (){}, useMaterial: true);
```

#### Text
<img src="../../../assets/clips/btn_text.png" alt="material text button" style="margin-left:6px;" />

```dart
  final NButtonFlat button1 = NButtonFlat(child: Text('Button'), onPressed: (){}, useMaterial: true);
  final NButtonFlat button2 = NButton.flat(child: Text('Button'), onPressed: (){}, useMaterial: true);
```

<img src="../../../assets/clips/btn_w_icon_text.png" alt="material text button" style="margin-left:6px;" />

```dart
  final NButtonFlatWithIcon button1 = NButtonFlatWithIcon(icon: Icon(Icons.star), label: 'Button', onPressed: (){}, useMaterial: true);
  final NButtonFlatWithIcon button2 = NButton.flatWithIcon(icon: Icon(Icons.star), label: 'Button', onPressed: (){}, useMaterial: true);
```

#### Contained
<img src="../../../assets/clips/btn_contained.png" alt="material contained button" style="margin-left:6px;" />

```dart
  final NButtonFilled button1 = NButtonFilled(child: Text('Button'), onPressed: (){}, useMaterial: true);
  final NButtonFilled button2 = NButton.filledWithIcon(child: Text('Button'), onPressed: (){}, useMaterial: true);
```

<img src="../../../assets/clips/btn_w_icon_contained.png" alt="material contained button" style="margin-left:6px;" />

```dart
  final NButtonFilledWithIcon button1 = NButtonFilledWithIcon(icon: Icon(Icons.star), label: 'Button', onPressed: (){}, useMaterial: true);
  final NButtonFilledWithIcon button2 = NButton.filledWithIcon(icon: Icon(Icons.star), label: 'Button', onPressed: (){}, useMaterial: true);
```

---

### [Human Interface types](https://developer.apple.com/design/human-interface-guidelines/ios/controls/buttons/)
<img src="../../../assets/clips/btns_cupertino.png" alt="human interface buttons" style="margin-top:16px;padding:16px;background:ghostwhite;float:right;margin-left:6px;margin-right:96px;" />

<table>
    <tbody>
        <tr>
            <td><h4>Plain</h4></td>
            <td><h4>Gray</h4></td>
            <td><h4>Tinted</h4></td>
            <td><h4>Filled</h4></td>
        </tr>
        <tr>
            <td><img src="../../../assets/clips/btn_plain.png" alt="material outlined button" /></td>
            <td><img src="../../../assets/clips/btn_gray.png" alt="material outlined button" /></td>
            <td><img src="../../../assets/clips/btn_tinted.png" alt="material outlined button" /></td>
            <td><img src="../../../assets/clips/btn_filled.png" alt="material outlined button" /></td>
        </tr>
    </tbody>
</table>












