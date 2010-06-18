SRCPATH=$1
BUILDPATH=$2
DISTROPATH=$3

SCRIPTDIR=$(cd $(dirname "$0"); pwd)

CFLAGS=
MOZCONFIG=$SCRIPTDIR/.mozconfig

rm -rf $DISTROPATH
mkdir $BUILDPATH
mkdir $DISTROPATH
cd $BUILDPATH
echo $BUILDID > $BUILDPATH/build_id.txt
TOPSRCDIR=$SRCPATH MOZ_OBJDIR=$BUILDPATH MOZCONFIG=$MOZCONFIG make -f $SRCPATH/client.mk build 
cp -pLR $BUILDPATH/dist/bin/ $DISTROPATH
