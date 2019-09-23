# MonorepoSample

This repo shows how we builds Monorepo iOS applications using XcodeGen. We hope you find it as useful as we do.

## To Install

Make sure [XcodeGen](https://github.com/yonaskolb/XcodeGen) installed. If not yet installed, just run `make bootstrap` to install tools and dependencies.

## Generating Xcode Project

To generate the project from the terminal, run `make project` from the root directory first. You can then run in the simulator.

You may also use breakpoints, just like normal when using the generated Xcode project.

## Generating Business Example Project

`cd` any directory with example.yml, run `make project`.

```shell
cd App/TAGoodsDetail
make project
```

## CLI

```bash
# generating and opening a Xcode project
make project

# Delete project and killall Xcode
make clean
```

## References

* [Monorepo](https://en.wikipedia.org/wiki/Monorepo)
* [Advantages of monorepos](https://danluu.com/monorepo/)
* [Faster Together: Uber Engineering’s iOS Monorepo](https://eng.uber.com/ios-monorepo/)
* [Monorepo 是什么，为什么大家都在用？](https://zhuanlan.zhihu.com/p/77577415)
* [Buck 在大规模 iOS 开发中的应用实践](https://myslide.cn/slides/8837)
* [2019年，抛弃 CMake，用 Bazel / Buck 来构建大型项目吧](https://zhuanlan.zhihu.com/p/53287816)
