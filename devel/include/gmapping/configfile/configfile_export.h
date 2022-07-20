
#ifndef CONFIGFILE_EXPORT_H
#define CONFIGFILE_EXPORT_H

#ifdef CONFIGFILE_STATIC_DEFINE
#  define CONFIGFILE_EXPORT
#  define CONFIGFILE_NO_EXPORT
#else
#  ifndef CONFIGFILE_EXPORT
#    ifdef configfile_EXPORTS
        /* We are building this library */
#      define CONFIGFILE_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define CONFIGFILE_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef CONFIGFILE_NO_EXPORT
#    define CONFIGFILE_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef CONFIGFILE_DEPRECATED
#  define CONFIGFILE_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef CONFIGFILE_DEPRECATED_EXPORT
#  define CONFIGFILE_DEPRECATED_EXPORT CONFIGFILE_EXPORT CONFIGFILE_DEPRECATED
#endif

#ifndef CONFIGFILE_DEPRECATED_NO_EXPORT
#  define CONFIGFILE_DEPRECATED_NO_EXPORT CONFIGFILE_NO_EXPORT CONFIGFILE_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef CONFIGFILE_NO_DEPRECATED
#    define CONFIGFILE_NO_DEPRECATED
#  endif
#endif

#endif /* CONFIGFILE_EXPORT_H */
