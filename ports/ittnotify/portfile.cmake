vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO JJL772/ittnotify
    REF 3e79d3e51efd5c29aca52b6840a6705b9a616e09
    SHA512 7bba4c9d21b4de5b4fc5c9cc5cf979e9833623ed2ba089217dd3afbf8083d421da57428f07b882388d97b17f7162224f842f7b1bf38d66265fc516ac783e1eca
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()

file(INSTALL ${SOURCE_PATH}/src/ittnotify/LICENSE.BSD DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
