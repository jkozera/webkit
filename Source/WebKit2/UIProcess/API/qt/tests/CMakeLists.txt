# FIXME: It should be in WebKitFS actually
set(FORWARDING_HEADERS_DIR "${DERIVED_SOURCES_DIR}/ForwardingHeaders")

include_directories(
    "${CMAKE_SOURCE_DIR}/Source"
    "${FORWARDING_HEADERS_DIR}/QtWebKit"
    "${WEBKIT_DIR}/qt/Api"
)

include_directories(SYSTEM
    ${Qt5Quick_INCLUDE_DIRS}
    ${Qt5Quick_PRIVATE_INCLUDE_DIRS}
    ${Qt5QuickTest_INCLUDE_DIRS}
)

set(tst_qmltests_DEFINITIONS
    IMPORT_DIR="${CMAKE_BINARY_DIR}/imports"
    QWP_PATH="${CMAKE_RUNTIME_OUTPUT_DIRECTORY}"
    TESTS_SOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}"
)

set(tst_qmltests_DesktopBehavior_DEFINITIONS
    ${tst_qmltests_DEFINITIONS}

    QUICK_TEST_SOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}/qmltests/DesktopBehavior"
    DISABLE_FLICKABLE_VIEWPORT=1
)

set(tst_qmltests_WebView_DEFINITIONS
    ${tst_qmltests_DEFINITIONS}

    QUICK_TEST_SOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}/qmltests/WebView"
)

set(qmltests_SOURCES
    bytearraytestdata.cpp
    util.cpp
    qmltests/tst_qmltests.cpp
)

qt5_add_resources(qmltests_SOURCES qmltests/resources.qrc)

set(qmltests_LIBRARIES
    WebKit
    ${Qt5Quick_LIBRARIES}
    ${Qt5QuickTest_LIBRARIES}
    ${Qt5Test_LIBRARIES}
)

add_executable(tst_qmltests_WebView ${qmltests_SOURCES})
target_compile_definitions(tst_qmltests_WebView PRIVATE ${tst_qmltests_WebView_DEFINITIONS})
target_link_libraries(tst_qmltests_WebView ${qmltests_LIBRARIES})

add_executable(tst_qmltests_DesktopBehavior ${qmltests_SOURCES})
target_compile_definitions(tst_qmltests_DesktopBehavior PRIVATE ${tst_qmltests_DesktopBehavior_DEFINITIONS})
target_link_libraries(tst_qmltests_DesktopBehavior ${qmltests_LIBRARIES})
