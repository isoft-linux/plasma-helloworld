# Copyright (C) 2014 - 2015 Cjacker <cjacker@gmail.com>
# Localization
FIND_PROGRAM(XGETTEXT xgettext)
FIND_PROGRAM(MSGFMT msgfmt)
FIND_PROGRAM(MSGMERGE msgmerge)

IF(NOT MSGFMT)
	MESSAGE( "------
			NOTE: msgfmt not found. Translations will *not* be installed
			------")
ELSE(NOT MSGFMT)

	SET(catalogname plasma_applet_org.kde.plasma.helloworld)

	FILE (GLOB PO_FILES *.po)
	FILE (GLOB SOURCES ../helloworld/package/contents/ui/*.qml)

	ADD_CUSTOM_TARGET(translations ALL)

	ADD_CUSTOM_COMMAND(TARGET translations
        COMMAND ${XGETTEXT} -o plasma_applet_org.kde.plasma.helloworld.pot -C -ki18n -ktr2i18n -kI18N_NOOP -ktranslate -kaliasLocale --no-location --from-code=utf-8 ${SOURCES} 
		DEPENDS ${_poFile})
	FOREACH(_poFile ${PO_FILES})
		GET_FILENAME_COMPONENT(_lang ${_poFile} NAME_WE)
		SET(_moFile ${_lang}.mo)
		ADD_CUSTOM_COMMAND(TARGET translations 
				COMMAND ${MSGMERGE} -q -U ${_poFile} --backup=none plasma_applet_org.kde.plasma.helloworld.pot
				COMMAND ${MSGFMT} --check -o ${_moFile} ${_poFile} 
				DEPENDS ${_poFile})
		INSTALL(FILES ${CMAKE_BINARY_DIR}/po/${_moFile}
			   	DESTINATION share/locale/${_lang}/LC_MESSAGES/
			   	RENAME ${catalogname}.mo)
	ENDFOREACH(_poFile ${PO_FILES})

ENDIF(NOT MSGFMT)
