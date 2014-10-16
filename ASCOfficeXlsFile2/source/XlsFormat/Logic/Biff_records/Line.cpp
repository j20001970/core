#include "precompiled_xls.h"
#include "Line.h"

namespace XLS
{;

Line::Line()
{
}


Line::~Line()
{
}


BaseObjectPtr Line::clone()
{
	return BaseObjectPtr(new Line(*this));
}


void Line::writeFields(CFRecord& record)
{
	unsigned __int16 flags = 0;
	SETBIT(flags, 0, fStacked);
	SETBIT(flags, 1, f100);
	SETBIT(flags, 2, fHasShadow);
	record << flags;
}


void Line::readFields(CFRecord& record)
{
	unsigned __int16 flags;
	record >> flags;
	fStacked = GETBIT(flags, 0);
	f100 = GETBIT(flags, 1);
	fHasShadow = GETBIT(flags, 2);
}

} // namespace XLS
