add_subdirectory(QtTestBrowser)

if (ENABLE_TEST_SUPPORT)
    add_subdirectory(DumpRenderTree)
    add_subdirectory(ImageDiff)
    add_subdirectory(TestWebKitAPI)
endif ()
