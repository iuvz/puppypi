
#ifndef GRIDFASTSLAM_EXPORT_H
#define GRIDFASTSLAM_EXPORT_H

#ifdef GRIDFASTSLAM_STATIC_DEFINE
#  define GRIDFASTSLAM_EXPORT
#  define GRIDFASTSLAM_NO_EXPORT
#else
#  ifndef GRIDFASTSLAM_EXPORT
#    ifdef gridfastslam_EXPORTS
        /* We are building this library */
#      define GRIDFASTSLAM_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define GRIDFASTSLAM_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef GRIDFASTSLAM_NO_EXPORT
#    define GRIDFASTSLAM_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef GRIDFASTSLAM_DEPRECATED
#  define GRIDFASTSLAM_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef GRIDFASTSLAM_DEPRECATED_EXPORT
#  define GRIDFASTSLAM_DEPRECATED_EXPORT GRIDFASTSLAM_EXPORT GRIDFASTSLAM_DEPRECATED
#endif

#ifndef GRIDFASTSLAM_DEPRECATED_NO_EXPORT
#  define GRIDFASTSLAM_DEPRECATED_NO_EXPORT GRIDFASTSLAM_NO_EXPORT GRIDFASTSLAM_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef GRIDFASTSLAM_NO_DEPRECATED
#    define GRIDFASTSLAM_NO_DEPRECATED
#  endif
#endif

#endif /* GRIDFASTSLAM_EXPORT_H */
